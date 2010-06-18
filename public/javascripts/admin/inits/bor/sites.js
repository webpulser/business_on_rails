jQuery(document).ready(function(){
  //init sortable
  $('#site .sortable').each(function(){
    $(this).sortable({
      handle:'.handler',
      placeholder: 'ui-state-highlight',
      stop:function(event,ui){
        $('#site-images .sortable li').removeClass('first-image');
        check_site_first_image();
      }
    });
  });

  $('#imageSelectDialog.sites').dialog({
    autoOpen:false,
    modal:true,
    minHeight: 380,
    width: 800,
    resizable:'se',
    buttons: {
      Ok: function(){
        dataTableSelectRows('#image-table:visible,#thumbnail-table:visible',function(current_table,indexes){
          for(var i=0; i<indexes.length; i++){
            var row = current_table.fnGetData(indexes[i]);
            var path = row.slice(-3,-2);
            var id = row.slice(-2,-1);
            var name = row.slice(-1);
            add_picture_to_element(path,id,name);
          }
          check_site_first_image();
        });
        $('#imageSelectDialog').dialog('close');
      }
    },
    open: function(){ $('#image-table:visible,#thumbnail-table:visible').dataTableInstance().fnDraw(); }
  });

  $('#fileSelectDialog.sites').dialog({
    autoOpen:false,
    modal:true,
    minHeight: 380,
    width: 800,
    resizable:'se',
    buttons: {
      Ok: function(){
        dataTableSelectRows('#table-files', function(current_table, indexes) {
          for(var i=0; i<indexes.length; i++){
            var row = current_table.fnGetData(indexes[i]);
            var size = row.slice(-6,-5);
            var type = row.slice(-8,-7);
            var id = row.slice(-2,-1);
            var name = row.slice(-1);

            add_attachment_to_site(id,name,size,type);
          }
        });
        $('#fileSelectDialog').dialog('close');
      }
    },
    open: function(){ $('#table-files').dataTableInstance().fnDraw(); }
  });



  init_category_tree('#site-tree','SiteCategory','/admin/site_categories.json');

  //init the tree for products/blocks associations
  $("#association-site-tree").tree({
    ui: {
      theme_path: '/stylesheets/jstree/themes/',
      theme_name : 'association_product',
      selected_parent_close: false
    },
    plugins:{
      'contextmenu': {}
    },
    rules: { multiple:'on' },
    callback: {
      onload: function(TREE_OBJ){
        tree_id = $(TREE_OBJ.container).attr('id');
        $(TREE_OBJ.container).removeClass('tree-default');
      },
      onrgtclk: function(NODE,TREE_OBJ,EV){
        EV.preventDefault(); EV.stopPropagation(); return false
      },
      onselect: function(NODE,TREE_OBJ){
        object_name = $(NODE).attr('id').split('_')[0];
        category_id = get_rails_element_id(NODE);
        $(NODE).append('<input type="hidden" id="'+object_name+'_product_category_'+category_id+'" name="'+object_name+'[site_category_ids][]" value="'+category_id+'" />');
        $(NODE).addClass('clicked');
      },
      ondeselect: function(NODE,TREE_OBJ){
        object_name = $(NODE).attr('id').split('_')[0];
        category_id = get_rails_element_id(NODE);
        $(NODE).children('input').remove();
        $(NODE).removeClass('clicked');
      }
    }
  });
});
