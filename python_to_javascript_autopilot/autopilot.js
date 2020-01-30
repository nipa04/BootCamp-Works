function get_new_car() {
  return {
    city: 'Toronto',
    passengers: 0,
    gas: 100
  }
}


function add_car(cars, new_car) {
  cars.push(new_car)
  return `Adding new car to fleet. Fleet size is now ${cars.length}.`
}

function pick_up_passenger(car) {
  car['passengers'] += 1;
  car['gas'] -= 10;
  return `Picked up passenger. Car now has ${car['passengers']} passengers.`
}

function get_destination(car) {
  if (car['city'] == 'Toronto') {
    return 'Mississauga';
  } else if (car['city'] == 'Mississauga') {
    return 'London'
  } else if (car['city'] == 'London') {
    return 'Toronto'
  }
}

function fill_up_gas(car) {
  const old_gas = car['gas'];
  car['gas'] = 100;
  return `Filled up to ${get_gas_display(car['gas'])} on gas from ${get_gas_display(old_gas)}.`
}

function get_gas_display(gas_amount) {
  return `${gas_amount}%`
}

function drive(car, city_distance) {
  if (car['gas'] < city_distance) {
    return fill_up_gas(car)
  }
  car['city'] = get_destination(car);
  car['gas'] -= city_distance;
  return `Drove to ${car['city']}. Remaining gas: ${get_gas_display(car['gas'])}.`
}

function drop_off_passengers(car) {
  const previous_passengers = car['passengers'];
  car['passengers'] = 0;
  return `Dropped off ${previous_passengers} passengers.`
}

function act(car) {
  const distance_between_cities = 50;
  if (car['gas'] < 20) {
    return fill_up_gas(car)
  } else if (car['passengers'] < 3) {
    return pick_up_passenger(car)
  } else {
    if (car['gas'] < distance_between_cities) {
      return fill_up_gas(car)
    }
    const drove_to = drive(car, distance_between_cities);
    const passengers_dropped = drop_off_passengers(car);
    return `${drove_to} ${passengers_dropped}`
  }
}

function command_fleet(cars) {
  let i = 1;
  cars.forEach(function(car) {
    action = act(car);
    console.log(`Car ${i}: ${action}`);
    i++;
  })

  console.log('---')
}

function add_one_car_per_day(cars, num_days) {
  for (day = 0; day < num_days; day++) {
    new_car = get_new_car();
    console.log(add_car(cars, new_car));
    command_fleet(cars);
  }
}

let cars = []
add_one_car_per_day(cars, 10);
