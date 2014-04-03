# Inline Autocomplete package
Originally a fork from [Autocomplete package](https://github.com/atom/autocomplete), but I made it's own repo to make reporting issues easier.

Inlines possible completions in the editor using `escape`, like Textmate's autocomplete.

![](http://imageshack.com/a/img203/3507/pmm.gif)

Looking to use a different keybinding? Copy the following to your
`~/.atom/keymap.cson` to tweak:
```
'.editor':
  'alt-space': 'inline-autocomplete:cycle'
```

For now, to set the keybind to confirm selection:
```
'.inline-autocompleting':
  'space': 'inline-autocomplete:stop'
```
Or you can click in the editor.

TODO:
 * Don't require a keybinding to cancel autocomplete. Maybe make editorView that listens for whitespace keys.
 
