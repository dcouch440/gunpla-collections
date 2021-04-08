const gunplaSlideShow = ({speed, elements}) => {

  const elementsArray = [...document.querySelectorAll(elements)];
  const arrayLength = elementsArray.length

  const hideAllImages = (elementsArray) => {
    elementsArray.forEach(
      element => {
        element.style.display = 'none';
      }
    )
  }

  const showOne = (current) => {
    elementsArray[current].style.display = 'block';
  }

  if (arrayLength > 0)
  {

    let currentIndex = 0;

    hideAllImages(elementsArray)
    showOne(currentIndex)

    setInterval(() => {
      // safeguards
      if (elementsArray.length == 0) {stopInterval();}
      if (currentIndex >= arrayLength) {currentIndex = 0;}

      hideAllImages(elementsArray)
      showOne(currentIndex)

      currentIndex += 1;

    }, speed)

  }

}

document.addEventListener('turbolinks:load', () => {
  gunplaSlideShow({speed: 3000, elements: '.caro-image'})
})