// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery
//= require jquery_ujs
//= require bxslider
//= require_tree .

//ロード
Pace.on('done', function(){
  $('.wrap').fadeIn(400);
});

//ラジオボタンリセット
function resetradio() {
    for (i = 1; i <= 6; i++) {
        document.getElementById('radio' + i).checked = false;
    }
}

function resetcheckboxl() {
    for (i = 1; i <= 4; i++) {
        document.getElementById('checkboxl' + i).checked = false;
    }
}


//マイページタブ
jQuery(function($){
	$('.tab').click(function(){
		$('.is-active').removeClass('is-active');
		$(this).addClass('is-active');
		$('.is-show').removeClass('is-show');
        // クリックしたタブからインデックス番号を取得
		const index = $(this).index();
        // クリックしたタブと同じインデックス番号をもつコンテンツを表示
		$('.panel').eq(index).addClass('is-show');
    $('.panel div').css('display','block')
	});
});

$(function(){
  $('.panel div').css('display','block')
});

jQuery(function($){
	$('.regi').click(function(){
		$('.is-active').removeClass('is-active');
		$(this).addClass('is-active');
		$('.is-show').removeClass('is-show');
        // クリックしたタブからインデックス番号を取得
		const index = $(this).index();
        // クリックしたタブと同じインデックス番号をもつコンテンツを表示
		$('.panel').eq(index).addClass('is-show');
    $('.panel div').css('display','block')
	});
});

$( document ).on ('turbolinks:load', (function(){
  $('.panel div').css('display','block')
}));


$(function(){
  $fileField = $('#files')

  // 選択された画像を取得し表示
  $($fileField).on('change', $fileField, function(e) {
    file = e.target.files[0]
    reader = new FileReader(),
    $preview = $("#img_field");

    reader.onload = (function(file) {
      return function(e) {
        $preview.empty();
        $preview.append($('<img>').attr({
          src: e.target.result,
          width: "100%",
          class: "preview",
          title: file.name
        }));
      };
    })(file);
    reader.readAsDataURL(file);
  });
});

$(function(){
  $fileField = $('#file')

  // 選択された画像を取得し表示
  $($fileField).on('change', $fileField, function(e){
    file = e.target.files[0]
    reader = new FileReader(),
    $preview = $("#face_img_field");

    reader.onload = (function(file) {
      return function(e) {
        $preview.empty();
        $preview.append($('<img>').attr({
          src: e.target.result,
          width: "100%",
          class: "face_preview",
          title: file.name
        }));
      };
    })(file);
    reader.readAsDataURL(file);
  });
});


//トップページスライダー
$(document).on ('turbolinks:load', (function(){
  $('.bxslider').bxSlider({
    auto: true,           // 自動スライド
    speed: 2000,          // スライドするスピード
    moveSlides: 1,        // 移動するスライド数
    pause: 6000,          // 自動スライドの待ち時間
    maxSlides: 1,         // 一度に表示させる最大数
	randomStart: true,    // 最初に表示するスライドをランダムに設定
    autoHover: true       // ホバー時に自動スライドを停止
  });
}));
