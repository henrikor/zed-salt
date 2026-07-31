; The Jinja grammar represents ordinary document text as an invisible token, so it
; cannot be injected in YAML-sized chunks. Parse the full document as YAML instead;
; the outer Jinja layer continues to highlight template delimiters and expressions.
((source_file) @injection.content
  (#set! injection.language "YAML"))
