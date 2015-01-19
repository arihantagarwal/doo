root = exports ? this

repeat_tags = {}

root.doo = (options..., callback) ->
  [period, tag] = options
  sleep_id = setInterval callback, period or 0
  if tag then repeat_tags[tag] = sleep_id

root.after = (period, callback) ->
  setTimeout callback, period or 0

root.undoo = (tag) ->
  if repeat_tags[tag]
    clearInterval(repeat_tags[tag])
    delete repeat_tags[tag]
