# Custom funcions

# create a git worktree related to the current branch
# opens cursor on the worktree directory

tsk() {
    # Check if help flag is provided
    if [[ "$1" == "--help" || "$1" == "-h" ]]; then
        echo "task: Manage git worktrees for tasks"
        echo "Usage: task [task_name]"
        echo ""
        echo "Options:"
        echo "  --help, -h    Display this help message"
        return 0
    fi
    # check if the current directory is a git repository
    if [[ ! -d ".git" ]]; then
        echo "Error: the current directory is not a git repository"
        return 1
    fi
    
    while true; do
        echo "---------------------"
        echo "AI Task Manager 0.5px"
        echo "---------------------"
        echo "1|o) Open all tasks of current project"
        echo "2) Give Task to Agent"
        echo "3|n) Create new task"
        echo "4|l) Show active tasks"
        echo "5|rm) Prune task list"
        echo "m) Merge tasks"
        echo "a) Merge all in"
        echo "q) Quit"
        echo ""
        echo -n "Select an option (1-6, m to merge, q to quit): "
        read choice
        
        case $choice in
            1|o)  
                # check if the task directory exists
                if [[ ! -d "../task" ]]; then
                    echo "Error: task directory not found"
                    return 1
                fi
                echo "Opening all tasks of current project..."
                ls ../task | xargs -I {} cursor ../task/{}
            ;;
            2)
                echo -n "Enter helper name and task description: "
                read helper_name task_description
                # create the git worktree
                hs -c "task($helper_name, $task_description)"  
            ;;
            3|n)
                echo -n "Enter task name: "
                read task_name
                # create the git worktree
                git worktree add -b task/$task_name ../task/$task_name
                # open the cursor on the task directory
                cursor ../task/$task_name
            ;;
            4|l)
                echo "Active tasks:"
                git worktree list | grep -E 'task/' | awk '{print $3, $1}'
            ;;
            5|rm)
                echo "Removing task dir, pruning git worktree, deleting git branches of form task/*..."
                rm -rf ../task
                git worktree prune
                git branch --v   | grep -E  'task/' | awk '{print $1}'  | xargs -I {} git branch -D {}
            ;;
            m|M)
                echo "Choose merging direction: "
                echo "1) For branches of tasks 1,2,3 git add,commit and merge them into current branch, write: a 1 2 3"
                echo "2) For current branch git add, commit and merge into branches of tasks 1,hh,3, write: b 1 hh 3"

                read -A merging_specification
                echo "the user has choosen: $merging_specification"
                # Parse the merging specification
                merging_specification=($merging_specification)
                
                # Verify that the input is valid
                if [[ ${#merging_specification[@]} -lt 1 ]]; then
                    echo "Error: Invalid merging specification. Need a direction (a/b)"
                    echo "the user has choosen:${#merging_specification[@]} "
                    return 1
                fi
                
                # Extract the merging direction
                merging_direction=$merging_specification[1]
                
                # Verify that the direction is either 'a' or 'b'
                if [[ "$merging_direction" != "a" && "$merging_direction" != "b" ]]; then
                    echo "Error: Merging direction must be 'a' or 'b'."
                    echo "the user has choosen: $merging_direction [merging_direction != a && merging_direction != b]"
                    return 1
                fi
                           
                merging_tasks=($(ls -d ../task/* | xargs -n 1 basename))
                current_branch=$(git branch --show-current)
                # Perform the merging based on the direction
                if [[ "$merging_direction" == "a" ]]; then

                    for task in "${merging_tasks[@]}"; do
                        echo "Merging task $task into current branch"
                        # Move to task directory, add, commit, and get branch name
                        (
                            cd ../task/$task
                            git add .
                            git commit -m "Agent commit: $task"
                            git branch --show-current | pbcopy
                        )
                        # Now back in parent branch, merge the task branch
                        git merge $(pbpaste)
                    done
                elif [[ "$merging_direction" == "b" ]]; then
                    git add .
                    git commit -m "Agent commit: $current_branch"

                    for task in "${task_branches[@]}"; do
                        echo "Merging current branch $current_branch into task $task"
                        (
                            cd ../task/$task
                            git merge $current_branch
                        )
                    done
                fi
            ;;
            q|Q)
                echo "Exiting task manager"
                return 0
            ;;
            a|A)
                echo "Merging all tasks into current branch, then current branch into all tasks"
                        
                       merging_tasks=($(ls -d ../task/* | xargs -n 1 basename))
                       current_branch=$(git branch --show-current)
                       git add .
                       git commit -m "Agent commit: $current_branch"
                       
                       for task in "${merging_tasks[@]}"; do
                        echo "Merging task $task into current branch"
                        # Move to task directory, add, commit, and get branch name
                        (
                            cd ../task/$task
                            git add .
                            git commit -m "Agent commit: $task"
                            git branch --show-current | pbcopy
                        )
                        # Now back in parent branch, merge the task branch
                        git merge $(pbpaste)
                    done
                    
                    for task in "${merging_tasks[@]}"; do
                    echo "Merging current branch $current_branch into task $task"
                             (
                                cd ../task/$task
                                git merge $current_branch
                            )
                    done
            ;;
            *)
                echo "Invalid option"
            ;;
        esac
        
        echo ""
        echo ""
        echo ""
    done
}

# file manipulation

# Find directory path by name
# Searches up the directory tree for a directory with the given name
# Usage: dirpath "dirname"
dirpath() {
# Check if help flag is provided
if [[ "$1" == "--help" || "$1" == "-h" ]]; then
    echo "dirpath: Find directory path by name"
    echo "Usage: dirpath dirname"
    echo ""
    echo "Searches up the directory tree for a directory with the given name"
    echo "and returns its full path. Will search up to 10 levels up from the"
    echo "current directory."
    echo ""
    echo "Options:"
    echo "  --help, -h    Display this help message"
    return 0
fi
# Check if an argument was provided
if [[ -z "$1" ]]; then
    echo "Error: no directory name provided"
    echo "Usage: dirpath dirname"
    return 1
fi

local dir_name="$1"
local current_path="$(pwd)"
local j=0

# Search up the directory tree for the target directory
while [[ "$(basename "$current_path")" != "$dir_name" && $j -lt 10 ]]; do
    current_path="$(dirname "$current_path")"
    ((j++))
done

# Check if we found the directory
if [[ "$(basename "$current_path")" == "$dir_name" ]]; then
    echo "$current_path"
    return 0
else
    echo "Error: directory '$dir_name' not found within 10 levels up"
    return 1
fi
}
