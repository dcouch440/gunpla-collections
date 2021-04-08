const gunplaSlideShow = ({speed, elements}) => {

  const elementArray = [...document.querySelectorAll(elements)];
  const arrayLength = elementArray.length

  const hideAllImages = (elementArray) => {
    elementArray.forEach(
      (data) => {
        data.style.display = 'none';
      }
    )
  }

  const showOne = (current) => {
    elementArray[current].style.display = 'block';
  }

  if (arrayLength > 0)
  {

    let currentIndex = 0;

    hideAllImages(elementArray)
    showOne(currentIndex)

    setInterval(() => {
      // safeguards
      if (elementArray.length == 0){stopInterval();}
      if (currentIndex >= arrayLength) {currentIndex = 0;}

      hideAllImages(elementArray)
      showOne(currentIndex)

      currentIndex += 1;

    }, speed)

  }

}

document.addEventListener('turbolinks:load', () => {
  gunplaSlideShow({speed: 3000, elements: '.caro-image'})
})