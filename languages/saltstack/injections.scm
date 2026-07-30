; The Jinja grammar exposes non-template content as html_content. Treat that content
; as YAML so ordinary Salt state and pillar syntax remains highlighted.
((html_content) @injection.content
  (#set! injection.language "YAML"))
