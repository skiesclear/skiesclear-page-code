import { navbar } from "vuepress-theme-hope";

export default navbar([
  {
    text: "Apple",
    icon: "pen-to-square",
    prefix: "/posts/apple/",
    children: [
      { text: "Apple1", icon: "pen-to-square", link: "1" },
      { text: "Apple2", icon: "pen-to-square", link: "2" },
      "3",
      "4",
    ],
  },
  {
    text: "Banana",
    icon: "pen-to-square",
    prefix: "/posts/banana/",
    children: [
      {
        text: "Banana 1",
        icon: "pen-to-square",
        link: "1",
      },
      {
        text: "Banana 2",
        icon: "pen-to-square",
        link: "2",
      },
      "3",
      "4",
    ],
  },
  {
    text: "Posts",
    icon: "pen-to-square",
    prefix: "/posts/other/",
    children: [
      { text: "Cherry", icon: "pen-to-square", link: "cherry" },
      { text: "Dragon Fruit", icon: "pen-to-square", link: "dragonfruit" },
      "tomato",
      "strawberry",
    ],
  }
]);
