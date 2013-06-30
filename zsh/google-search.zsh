function urlencode {
      echo -n "$@" | perl -MURI::Escape -ne 'print uri_escape($_)'
}
function g {
    open "http://google.com/search?q=$( urlencode "$@" )"
}
