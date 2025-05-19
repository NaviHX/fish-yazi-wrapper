function __fish-yazi-wrapper -d 'y wrapper for yazi'
    set -f tmp (mktemp -t "yazi-cwd.XXXXXX")
    if not [ -f "$tmp" ]
        builtin echo "Error: Failed to create cwd-file for yazi"
        return 1
    end

    yazi $argv --cwd-file="$tmp"

    set -f cwd (command cat -- "$tmp")
    if [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end

    command rm -- "$tmp"
end
