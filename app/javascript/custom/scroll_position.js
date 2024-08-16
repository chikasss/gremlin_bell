// Save scroll position
const saveScrollPosition = () => {
  const scrollPosition = window.scrollY || document.documentElement.scrollTop;
  sessionStorage.setItem('scrollPosition', scrollPosition);
};

// Restore scroll position
const restoreScrollPosition = () => {
  const scrollPosition = sessionStorage.getItem('scrollPosition');
  if (scrollPosition !== null) {
    window.scrollTo(0, parseInt(scrollPosition, 10));
    sessionStorage.removeItem('scrollPosition');
  }
};

document.addEventListener('turbo:before-fetch-request', saveScrollPosition);
document.addEventListener('turbo:load', restoreScrollPosition);
