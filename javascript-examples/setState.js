const assert = require('assert');

let state = 0;

/*
 * `increment` is a pure function
 * so it doesn't depend on anything outside of it.
 * For each passed argument it always returns the same result.
 * Therefore, it's easy to test it!
 */
function increment(state) {
  return state + 1;
}

assert.equal(increment(1), 2);

/*
 * By passing the `update` callback
 * we can ensure that the state used for the update
 * is not stale, despite the concurrent execution.
 */
function setState(update, cb) {
  setTimeout(() => {
    state = update(state);
    if (cb) cb();
  });
}

setState(state => increment(state));
setState(state => increment(state));

/*
 * To test the `setState`, we have to wait for it to finish.
 * We can do this by passing a callback which will be called
 * after the `setState` updates the state.
 */
setState(state => increment(state), () => assert.equal(state, 3));

