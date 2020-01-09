// import React from 'react';
// import FilterItem from './FilterItem';
//
// const Filters = ({ filters }) => {
//   const filterElements = filters.map((filter, i) => <FilterItem key={i} id={i} filter={ filter } />);
//
//   return (
//     <section id="filterCategories">
//       <ul className="filters">
//         { filterElements }
//       </ul>
//       <form id="newCat" className="cat-new">
//         <input type="text" name="item" id="itemName" className="form-component inpt" placeholder="New Category"/>
//       </form>
//     </section>
//   );
// };
//
// export default Filters;
import React from 'react';
import FilterItem from './FilterItem';

const Filters = ({ filters, onFilterSelect, selectedFilter }) => {
  // filters is an array of filters
  // filter is something like: {name: 'All', value: 'all'}
  const filterElements = filters.map((filter, i) => <FilterItem key={i} id={i} filter={ filter } selectedFilter={ selectedFilter } onFilterSelect={ onFilterSelect }/>);

  return (
    <section id="filterCategories">
      <ul className="filters">
        { filterElements }
      </ul>
      <form id="newCat" className="cat-new">
        <input type="text" name="item" id="itemName" className="form-component inpt" placeholder="New Category"/>
      </form>
    </section>
  );
};

export default Filters;








// <section id="filterCategories">
//   <ul class="filters">
//     <li><input type="radio" name="category" value="all" id="filter0" checked><label for="filter0">all</label></li>
//     <li><input type="radio" name="category" value="meat" id="filter1"><label for="filter1">meat</label></li>
//     <li><input type="radio" name="category" value="prod" id="filter2"><label for="filter2">prod</label></li>
//     <li><input type="radio" name="category" value="dairy" id="filter3"><label for="filter3">dairy</label></li>
//     <li><input type="radio" name="category" value="bakery" id="filter4"><label for="filter4">bakery</label></li>
//   </ul>
//   <form id="newCat" class="cat-new">
//     <input type="text" name="item" id="itemName" class="form-component inpt" placeholder="New Category">
//   </form>
// </section>
