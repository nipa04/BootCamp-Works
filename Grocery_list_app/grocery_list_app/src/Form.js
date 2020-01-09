// import React from 'react';
//
// const Form = () => {
//   return (
//    <form id="newItem" className="newitem" auto-complete="off">
//      <label htmlFor="itemName" className="line-label">New Item</label>
//      <div className="addnew">
//        <input type="text" name="item" id="itemName" className="form-component inpt" placeholder="What do you need?" />
//        <input type="submit" value="Add" className="form-component btn" />
//      </div>
//    </form>
//   );
// };
//
// export default Form;

import React, { useRef } from 'react';

const Form = ({ onAdd }) => {

  const itemRef = useRef();

  const handleAdd = (event) => {
    event.preventDefault();

    // defaults - type: 'prod', quantity: 1
    const newItem = {
      name: itemRef.current.value,
      type: 'prod',
      quantity: 1
    };

    onAdd(newItem);
  };

  return (
   <form onSubmit={ handleAdd } id="newItem" className="newitem" auto-complete="off">
     <label htmlFor="itemName" className="line-label">New Item</label>
     <div className="addnew">
       <input ref={itemRef} type="text" name="item" id="itemName" className="form-component inpt" placeholder="What do you need?" />
       <input type="submit" value="Add" className="form-component btn" />
     </div>
   </form>
  );
};

export default Form;
