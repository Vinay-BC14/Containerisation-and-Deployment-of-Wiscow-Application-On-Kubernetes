#!/usr/bin/env bash

SRVPORT=4499
RSPFILE=response

# Check for prerequisites
prerequisites() {
    command -v cowsay >/dev/null 2>&1 &&
    command -v fortune >/dev/null 2>&1 ||
    { 
        echo "Install prerequisites."
        exit 1
    }
}

# Handle incoming API requests
handleRequest() {
    line=$(head -n 1)
    mod=$(fortune)

    cat <<EOF > $RSPFILE
HTTP/1.1 200

<pre>\`cowsay \$mod\`</pre>
EOF
}

# Main function
main() {
    prerequisites
    echo "Wisdom served on port=$SRVPORT..."

    while true; do
        nc -lN $SRVPORT | handleRequest
        sleep 0.01
    done
}

main
