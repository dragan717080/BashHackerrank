#!/bin/bash

read s

[[ "$s" =~ [[:alnum:]] ]] && echo "True" || echo "False"

[[ "$s" =~ [[:alpha:]] ]] && echo "True" || echo "False"

[[ "$s" =~ [[:digit:]] ]] && echo "True" || echo "False"

[[ "$s" =~ [[:lower:]] ]] && echo "True" || echo "False"

[[ "$s" =~ [[:upper:]] ]] && echo "True" || echo "False"

