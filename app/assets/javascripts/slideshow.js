const slideShow = ({speed}) => {

  const caroData = [...document.querySelectorAll('.caro-image')];
  const caroLength = caroData.length;

  if (caroLength > 0) {

    caroData.forEach((data) => {
      data.style.display = 'none';
    })

    let counter = 0;
    caroData[counter].style.display = 'inherit';

    setInterval(() => {
      if (caroData.length == 0){
          stopInterval();
      }
      caroData.forEach((data) => {
          data.style.display = 'none';
      })

      if (counter >= caroLength) {counter = 0;}

      caroData[counter].style.display = 'inherit';
      counter += 1;

    }, speed)
  }

}

document.addEventListener('turbolinks:load', () => {
  slideShow({speed: 3000})
})