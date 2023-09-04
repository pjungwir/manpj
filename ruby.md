# Nil tricks

- `then`: Passes `self` to the given callable and passes along its return value.
  This is handy combined with `&.`, e.g.:

  ```
  s&.then(&Time.method(:parse))
  ```

  You will get a `nil` if `s` is `nil`, otherwise you'll get `Time.parse(s)`.


- `o.()`: This is a synonym for `o.call()`.
  I don't know why you'd prefer the terse way but I worked with someone once who loved to write this everywhere.

