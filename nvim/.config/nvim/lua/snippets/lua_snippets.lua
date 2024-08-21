local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets('go', {
  s('print', {
    t 'fmt.Println("',
    i(1, 'Hello, Go!'),
    t '")',
  }),
  s('printf', {
    t 'fmt.Printf("',
    i(1),
    t '", %',
    i(2),
    t ')',
  }),
  s('htroute', {
    t 'func (',
    i(1),
    t ') ',
    i(2),
    t '(w http.ResponseWriter, r *http.Request) {',
    i(0),
    t '}',
  }),
  s('htmx', {
    t 'fmt.Sprintf(`',
    i(1),
    t '`)',
  }),
})

ls.add_snippets('html', {
  s('html', {
    t {
      '<!DOCTYPE html>',
      '<html lang="en">',
      '<head>',
      '\t<meta charset="UTF-8">',
      '\t<meta http-equiv="X-UA-Compatible" content="IE=edge">',
      '\t<meta name="viewport" content="width=device-width, initial-scale=1.0">',
      '\t<title>',
    },
    i(1, 'Title'),
    t {
      '</title>',
      '</head>',
      '<body>',
      '\t',
    },
    i(2),
    t {
      '',
      '</body>',
      '</html>',
    },
  }),
})
