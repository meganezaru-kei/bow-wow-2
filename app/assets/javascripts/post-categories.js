$(document).on('turbolinks:load', function(){
  $(function(){
    // カテゴリーセレクトボックスのオプションを作成
    function appendOption(category){
      var html = `<option value="${category.name}" data-category="${category.id}">${category.name}</option>`;
      return html;
    }
    // 子カテゴリーの表示作成
    function appendChidrenBox(insertHTML){
      var childSelectHtml = '';
      childSelectHtml = `
      <select id="child_category" class="form-control mt-2" name="post[child_category]">
        <option value="---">---</option>
        ${insertHTML}
      </select>`;
      $('#category').append(childSelectHtml);
    }  
    // 親カテゴリー選択後のイベント
    $('#parent_category').on('change', function(){
      var parentCategory = document.getElementById('parent_category').value; //選択された親カテゴリーの名前を取得
      if (parentCategory != "---"){ //親カテゴリーが初期値でないことを確認
        $.ajax({
          url: '/posts/set_category_children',
          type: 'GET',
          data: { parent_name: parentCategory },
          dataType: 'json'
        })
        .done(function(children){
          $('#child_category').remove(); //親が変更された時、子以下を削除するする
          var insertHTML = '';
          children.forEach(function(child){
            insertHTML += appendOption(child);
          });
          appendChidrenBox(insertHTML);
        })
        .fail(function(){
          alert('カテゴリー取得に失敗しました');
        })
      }else{
        $('#child_category').remove(); //親カテゴリーが初期値になった時、子以下を削除するする
      }
    });
  });
});

// =======================
//        トップ画面
// =======================

$(document).on('turbolinks:load', function(){
  $(function(){
    // カテゴリーセレクトボックスのオプションを作成
    function appendOption(category){
      var html = `<option value="${category.name}" data-category="${category.id}">${category.name}</option>`;
      return html;
    }
    // 子カテゴリーの表示作成
    function appendChidrenBox(insertHTML){
      var childSelectHtml = '';
      childSelectHtml = `
      <select id="search_child_category" class="form-control post-list__select" onchange="submit(this.form);" name="q[child_category_eq]">
        <option value="---">---</option>
        ${insertHTML}
      </select>
      `;
      $('#search_category').append(childSelectHtml);
    }  
    // 親カテゴリー選択後のイベント
    $('#search_parent_category').on('change', function(){
      var parentCategory = document.getElementById('search_parent_category').value; //選択された親カテゴリーの名前を取得
      if (parentCategory != "犬種で絞り込み"){ //親カテゴリーが初期値でないことを確認
        $.ajax({
          url: '/posts/set_category_children',
          type: 'GET',
          data: { parent_name: parentCategory },
          dataType: 'json'
        })
        .done(function(children){
          $('#search_child_category').remove(); //親が変更された時、子以下を削除するする
          var insertHTML = '';
          children.forEach(function(child){
            insertHTML += appendOption(child);
          });
          appendChidrenBox(insertHTML);
        })
        .fail(function(){
          alert('カテゴリー取得に失敗しました');
        })
      }else{
        $('#search_child_category').remove(); //親カテゴリーが初期値になった時、子以下を削除するする
      }
    });
  });
});

// ==================================================
// 子カテゴリが選択されたいないときにアラートを出す（new）
// ==================================================
$(document).on('turbolinks:load', function(){
  $('#new_post').on('submit', function(e){
    var parent_category = $("#parent_category").val();
    var child_category = $("#child_category").val();
    if(parent_category == "---" || child_category == "---"){
      e.preventDefault();
      $.ajax({
      }).done(function(){
        alert('犬種を選択してください');
        $('input[name="commit"]').prop('disabled', false);
      }).fail(function(){
        alert('ajax失敗');
      })
    }
  })
})
// ==================================================
// 子カテゴリが選択されたいないときにアラートを出す（edit）
// ==================================================
$(document).on('turbolinks:load', function(){
  $('.edit_post').on('submit', function(e){
    var parent_category = $("#parent_category").val();
    var child_category = $("#child_category").val();
    if(parent_category == "---" || child_category == "---"){
      e.preventDefault();
      $.ajax({
      }).done(function(){
        alert('犬種を選択してください');
        $('input[name="commit"]').prop('disabled', false);
      }).fail(function(){
        alert('ajax失敗');
      })
    }
  })
})
