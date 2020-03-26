// =============================
//   アップロードボタンを出現させる
// =============================

$(document).on('turbolinks:load', function(){
  $(document).on('change', `input[type=file]`, function(){
    var img_count = $('.image-box').length + 1;
    var input_area = $('#post-images-area');
    var new_input = $(`<input multiple="multiple" class="image-upload-btn" id="post_images_${img_count + 1}" type="file" name="post[images][]">`);
    input_area.append(new_input);
  })
});

// ===============================
//        プレビュー表示機能
// ===============================

$(document).on('turbolinks:load', function() {
  $(function(){
    function appendPicture(image_id, picture){
      var html = `
      <div class="image-box m-3 float-left" id="image-box-${image_id}">
        <img class="mb-1" style="object-fit: cover; border-radius: 5px" src="${picture}" width="120" height="120">
        <div class="delete-btn" id="delete-btn-${image_id}"><i class="far fa-times-circle"></i></div>
      </div>
      <label class="add_image text-center m-3 float-left" for="post_images_${image_id + 1}" id="have_${image_id}_img">+</label>`;
      return html;
    }

    function displayPicture(image_id, pictureOriginal){
      var insertPicture = "";
      insertPicture = appendPicture(image_id, pictureOriginal);
      $(`#have_${image_id - 1}_img`).remove();
      
      if($('div').hasClass('image-box') == true){
        $('.image-boxes:last').append(insertPicture);
      }else{
        $('.image-boxes').append(insertPicture);
      }
    }
    
    $(document).on("change", 'input[type=file]', function(e){
      var img_count = $('.image-box').length;
      var picture_file = e.target.files[0];
      var reader = new FileReader();
      
      reader.addEventListener("load", function(){
        var image_id = img_count + 1;
        displayPicture(image_id, reader.result);
      }, false);
      
      if(picture_file){
        reader.readAsDataURL(picture_file);
      }  
    })
  })
})

// =========================================
//      プレビュー削除ボタンを押した時の挙動
// =========================================

$(document).on('turbolinks:load', function(){
  $(document).on('click', `.delete-btn`, function(){

    var img_count = $('.image-box').length;
    img_count = parseInt(img_count);
    $('.add_image').attr('for', `post_images_${img_count}`);
    $('.add_image').attr('id', `have_${img_count - 1}_img`);

    var image_id = $(this).attr('id');
    image_id = image_id.slice(-1);
    image_id = parseInt(image_id);
    $(`.check-box-${image_id}`).prop('checked', true);
    $(`#post_images_${image_id}`).remove();
    $(`#image-box-${image_id}`).remove();
    for( var i = image_id; i < 7; i++ ){
      $(`.check-box-${i + 1}`).attr('class', `check-box-${i}`);
      $(`#post_images_${i + 1}`).attr('id', `post_images_${i}`);
      $(`#image-box-${i + 1}`).attr('id', `image-box-${i}`);
      $(`#delete-btn-${i + 1}`).attr('id', `delete-btn-${i}`);
    };
  })
})

// ============================================
// new画面およびedit画面に遷移したらリロード（バグ対策）
// ============================================

$(document).on('turbolinks:load', function(){
  var path = location.pathname;
  var array = path.split('/');
  var id = array[2];
  if (path.match("/posts/new")){
    if (window.name != "new_post"){
      location.reload();
      window.name = "new_post";
    }
  } else if (path.match("/posts") && path.match("/edit")){
    if (window.name != `edit_post_${id}`){
      location.reload();
      window.name = `edit_post_${id}`;
    }
  }
})

// ==================================================
// 画像枚数が０のときにアラートを出す（edit）
// ==================================================
$(document).on('turbolinks:load', function(){
  $('#posts_form').on('submit', function(e){
    var img_count = $('.image-box').length;
    img_count = parseInt(img_count);
    if(img_count == 0){
      e.preventDefault();
      $.ajax({
      }).done(function(){
        alert('画像を1枚以上選択してください');
        $('input[name="commit"]').prop('disabled', false);
      }).fail(function(){
        alert('ajax失敗');
      })
    }
  })
})