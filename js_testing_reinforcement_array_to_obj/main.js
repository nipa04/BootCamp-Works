function arrayToObj(inputArray) {
  const outputArrayOfJsObject = {};
  inputArray.map((objects) => {
    director = objects[0];
    movie = objects[1];
    outputArrayOfJsObject[director] = movie;
  });
  return outputArrayOfJsObject;
}

module.exports = arrayToObj;
