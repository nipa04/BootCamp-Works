// import React from 'react';
// import Form from './Form';
// import Filters from './Filters';
// import List from './List';
//
// const App = () => {
//   const filters = [
//     { name: 'All', value: 'all' },
//     { name: 'Meat', value: 'meat' },
//     { name: 'Produce', value: 'prod' },
//     { name: 'Dairy', value: 'dairy' },
//     { name: 'Bakery', value: 'bakery' },
//   ];
//
//   const items = [
//     { name: 'Steak', type: 'meat', quantity: 3 },
//     { name: 'Apples', type: 'prod', quantity: 4 },
//     { name: 'Milk (1L, 2%)', type: 'dairy', quantity: 1 },
//     { name: 'Baguettes', type: 'bakery', quantity: 2 },
//   ];
//
//   return (
//     <main className="layout" id="app">
//       <header className="header">
//         <h1>Grocery List</h1>
//       </header>
//       <Form />
//       <Filters filters={ filters }/>
//       <List items={ items } />
//     </main>
//   );
// };
//
// export default App;


import React, { useState } from 'react';
import Form from './Form';
import Filters from './Filters';
import List from './List';

const App = () => {

  const initialFilters = [
    { name: 'All', value: 'all' },
    { name: 'Meat', value: 'meat' },
    { name: 'Produce', value: 'prod' },
    { name: 'Dairy', value: 'dairy' },
    { name: 'Bakery', value: 'bakery' },
  ];

  const initialItems = [
    { name: 'Steak', type: 'meat', quantity: 3 },
    { name: 'Apples', type: 'prod', quantity: 4 },
    { name: 'Milk (1L, 2%)', type: 'dairy', quantity: 1 },
    { name: 'Baguettes', type: 'bakery', quantity: 2 },
  ];

  const initialFilter = 'all';

  // make this data stateful
  const [filters, setFilters] = useState(initialFilters);
  const [items, setItems] = useState(initialItems);
  const [selectedFilter, setFilter] = useState(initialFilter);

  // function to add a new item to the grocery list
  const addItem = (item) => {
    setItems((currentItems) => [...currentItems, item]);
  };

  const onSelect = (filterValue) => {
    setFilter(filterValue);
  };

  return (
    <main className="layout" id="app">
      <header className="header">
        <h1>Grocery List</h1>
      </header>
      <Form onAdd= { addItem } />
      <Filters filters={ filters } onFilterSelect = { onSelect } selectedFilter = { selectedFilter } />
      <List items={ items } selectedFilter={ selectedFilter } />
    </main>
  );
};

export default App;
