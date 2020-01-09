// import React from 'react';
// import ListItem from './ListItem';
//
// const List = ({ items }) => {
//   const itemElements = items.map((item, i) => <ListItem key={i} item={ item } />);
//
//   return (
//     <ul id="shoppingList" className="shoppinglist">
//       { itemElements }
//     </ul>
//   );
// };
//
// export default List;
//
//
//

import React from 'react';
import ListItem from './ListItem';

const List = ({ items, selectedFilter }) => {
  // items is an array of items
  // item is something like: { name: 'Steak', type: 'meat', quantity: 3 }

  const itemElements = items.filter((item) => (selectedFilter === 'all') ? true : (item.type === selectedFilter)).map((item, i) => <ListItem key={i} item={ item } />);

  return (
    <ul id="shoppingList" className="shoppinglist">
      { itemElements }
    </ul>
  );
};
export default List;
