$(document).ready(function() {
  
  if( $('#matPrice1, #matPrice2, #matPrice3').length ){
    $('#matPrice1, #matPrice2, #matPrice3').editable({
      mode: 'inline',
      type: 'text',
      pk: 1,
      url: '/post',
      title: 'Enter Price'
    });
  }
  
});