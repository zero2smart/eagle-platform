$(document).ready(function() {
  
  if( $('#matPrice').length ){
    $('#matPrice').editable({
      mode: 'inline',
      type: 'text',
      pk: 1,
      url: '/post',
      title: 'Enter username'
    });
  }

  if( $('#matStatus').length ){
    $('#matStatus').editable({
      mode: 'inline',
      type: 'select',
      pk: 1,
      url: '/post',
      value: 1,
      title: 'Enter username',
      source: [
        {value: 1, text: 'Active'},
        {value: 2, text: 'Inactive'},
      ]
    });
  }

  if( $('#matUnit').length ){
    $('#matUnit').editable({
      mode: 'inline',
      type: 'select',
      pk: 1,
      url: '/post',
      value: 1,
      title: 'Enter username',
      source: [
        {value: 1, text: 'Yard'},
        {value: 2, text: 'Ton'},
      ]
    });
  }
  
});