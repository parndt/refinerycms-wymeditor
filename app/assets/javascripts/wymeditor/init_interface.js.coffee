@visual_editor_init_interface_hook = =>
  $("textarea.wymeditor, textarea.visual_editor").each ->
      textarea = $(this)
      if (instance = WYMeditor.INSTANCES[$((textarea.next(".wym_box").find("iframe").attr("id") or "").split("_")).last().get(0)])?
        if (next = textarea.parent().next())? and next.length > 0
          next.find("input, textarea").keydown($.proxy((e) ->
            shiftHeld = e.shiftKey
            if shiftHeld and e.keyCode == $.ui.keyCode.TAB
              @_iframe.contentWindow.focus()
              e.preventDefault()
          , instance)).keyup (e) ->
            shiftHeld = false
        if (prev = textarea.parent().prev())? and prev.length > 0
          prev.find("input, textarea").keydown $.proxy((e) ->
            if e.keyCode == $.ui.keyCode.TAB
              @_iframe.contentWindow.focus()
              e.preventDefault()
          , instance)
