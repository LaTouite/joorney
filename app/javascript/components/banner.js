// app/javascript/components/banner.js
import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["simple", "fun", "collaboratif", "rapide"],
    typeSpeed: 50,
    loop: true
  });
}

export { loadDynamicBannerText };
