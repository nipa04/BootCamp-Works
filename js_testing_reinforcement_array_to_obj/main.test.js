const arrayToObj = require('./main.js');

test('arrayToObj converts nested array to JS object', () => {
  const result = arrayToObj([['Alfonso Cuaron', 'Gravity'], ['Spike Jonze', 'Her'], ['Martin Scorsese', 'The Wolf of Wall Street']]);
  expect(result).toEqual({"Alfonso Cuaron": "Gravity", "Spike Jonze": "Her", "Martin Scorsese": "The Wolf of Wall Street"});
});
