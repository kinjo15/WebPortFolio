var appear = false;
var pagetop = document.getElementById('page_top');
var jump_contents = document.getElementsByClassName('jump-content');
var boxes = document.getElementsByClassName('box');

'load scroll click'.split(' ').forEach((eventName)=>{
    window.addEventListener(eventName, ()=>{
      var scroll = window.scrollY;
      var windowHeight = window.innerHeight;

      //要素が画面内に入ったらフェードインする
      Array.prototype.forEach.call(jump_contents, (e,index) => {
        var cntPos = e.getBoundingClientRect().top + window.pageYOffset;
        var showPos = cntPos - windowHeight + windowHeight / 5;
        
        if(scroll > showPos){
          boxes[index].classList.add('show');
        }
      });

      //TOPへ戻るボタンの表示・非表示制御
      if(scroll > 200)
      {
        if (appear == false && pagetop) {
          appear = true;
          pagetop.animate({
            opacity: [0, 1],
          } , {
              duration: 200,
              fill: 'forwards'
          });
          pagetop.style.pointerEvents = 'auto';
        }
      } else {
        if (appear && pagetop) {
          appear = false;
          pagetop.animate({
            opacity : [1, 0],
          } , {
              duration: 200,
              fill: 'forwards'
          });
          pagetop.style.pointerEvents = 'none';
        }
      }
  });
});

//TOPへ戻るボタンがクリックされたら、0.5秒かけてTOPに戻る
pagetop?.addEventListener('click', function() {
    new SmoothScroll('a[href*="#"]', {
    speed: 500,
    });
});