## doo

**doo** is a Coffeescript library to create timed repeats of executions as well as delayed executions. It is a purely syntactic sugar that makes the joy of everyday scripting even more caffienated. The library is tested in Coffeescript, but it should work well with Javascript, as well.

The library is runtime specific, and is known to work fine with major browsers and node. If your runtime does not support it, raise an issue and I would look for ways to make it work for you.

Library provides functions `doo`, `undoo`, `after` in version 1.0.x

## Examples

    doo -> console.log "Hello world."
      # This will loop console.log foreover with 0 ms delay.
    
    doo 5000, -> do_stuff()
      # This will run do_stuff() every 5 seconds. Time must be passed in ms.
      
    doo 5000, "myTag", -> do_stuff()
      # This will run do_stuff() every 5 seconds. This loop is called "myTag"

The `doo` function uses `setTimeout` and loops through the callback function depending on the period passed or with 0 ms, if no period is passed. You can optionally pass a `tag` which will help you stop the looping at a later stage.

    undoo "myTag"
      # This will stop running the doo iteration tagged as "myTag"

One of the painpoints of using `setTimeout` is the lack of simple control over iterating procedures. The library provides a simple mechanism where a tag can be passed during invokation of `doo` function, which can be used with `undoo` to stop iteration at any time during the execution of the program. The tags passed should be unique and get overwritten without warning. This should be diligently known to mitigate risk of zombie `doo` instances.

    after 5000, -> do_stuff()
      # This will run do_stuff after 5 seconds.

Pretty self-explanatory, `after` runs the callback function after specified delay. This can also be used with `doo` to create dynamic looping. One can create a `doo` instance with small or no delay, and within that invoke `after`, delay of which one could set dynamically. This works great in fetching scripts or implementing dynamic repeat joobs.


## Installation

**doo** is compatible with Node.js and all major web browsers. One can use npm:

    npm install doo

and then `require` it as follows:

    {doo, after, undoo} = require 'doo'

For other runtimes, use `doo.js` file from `lib` directory.


## License

All sources are provided under MIT License. Look for `LICENSE` file for more details and permissions.