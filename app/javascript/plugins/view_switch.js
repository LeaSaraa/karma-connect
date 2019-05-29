const switchTab = (e) => {
  console.log(e);
  e.preventDefault();
  const sections = document.querySelectorAll(".sections");
  sections.forEach(function (section) {
        section.classList.add('display-none');
    });
  const el = e.currentTarget;
  const section = document.querySelector(el.dataset.section);
  section.classList.remove('display-none');
  console.log(el.dataset.section);
  if (el.dataset.section === '#map-view') {
    window.mapBoxMap.resize();
  }
}

const initViewSwitch = () => {
  const links = document.querySelectorAll(".switch-link");
  if(links) {
    console.log(links)

    links.forEach(function (link) {
        link.addEventListener("click", switchTab, false);
    });
  }
}





export {initViewSwitch};
