var SearchModule = (function(){
  addMoreInputs = function(){
    var next = 1;
    $(".add-more").click(function(e){
        e.preventDefault();
        var addto = "#field" + next;
        var addRemove = "#field" + (next);
        next = next + 1;
        var newIn = '<input autocomplete="off" class="input form-control" id="field' + next + '" name="field' + next + '" type="text">';
        var newInput = $(newIn);
        var removeBtn = '<button id="remove' + (next - 1) + '" class="btn btn-danger remove-me" >-</button></div><div id="field">';
        var removeButton = $(removeBtn);
        $(addto).after(newInput);
        $(addRemove).after(removeButton);
        $("#field" + next).attr('data-source',$(addto).attr('data-source'));
        $("#count").val(next);

            $('.remove-me').click(function(e){
                e.preventDefault();
                var fieldNum = this.id.charAt(this.id.length-1);
                var fieldID = "#field" + fieldNum;
                $(this).remove();
                $(fieldID).remove();
            });
    });
  }

  populateSearchFields = function(){
    // Arrays of all the empty search fields
    for (var i=0; i < $('.t1name').length; i++){
      $($('.sfield1')[i]).val($($('.t1name')[i]).text())
    }
    for (var i=0; i < $('.t2name').length; i++){
      $($('.sfield2')[i]).val($($('.t2name')[i]).text())
    }

  }

  clearSearchFields = function(){
    for (var i=0; i< $('.sfield1').length; i++){
      $($('.sfield1')[i]).val("")
    }
    for (var i=0; i< $('.sfield2').length; i++){
      $($('.sfield2')[i]).val("")
    }
  }

  clickListener = function(){
    $('.clear-btn').click(function(){
      clearSearchFields()
    })
  }

  return {
    populateSearchFields: populateSearchFields,
    clearSearchFields: clearSearchFields,
    clickListener: clickListener
  }

})()

$(document).ready(function(){
  SearchModule.populateSearchFields();
  SearchModule.clickListener();
});