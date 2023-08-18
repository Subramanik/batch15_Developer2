import { LightningElement } from 'lwc';

export default class P2cNonPrimitiveCarouselParent extends LightningElement {

    carouselList = [
        {
            src: "https://previews.123rf.com/images/ksenija2015/ksenija20151802/ksenija2015180200008/96121900-white-fluffy-bunny-on-a-wooden-background.jpg",
            header: "First Card",
            description: "First card description.",
            alternativeText: "First card accessible description.",
            href: "javascript:void(0);"
        },
        {
            src: "https://static.vecteezy.com/system/resources/thumbnails/017/323/715/small/3d-render-adorable-close-up-of-a-american-eskimo-dog-holding-red-rose-in-mouth-on-white-background-photo.jpg",
            header: "Second Card",
            description: "Second card description.",
            alternativeText: "Second card accessible description.",
            href: "javascript:void(0);"
        },
        {
            src: "https://images.rawpixel.com/image_png_800/czNmcy1wcml2YXRlL3Jhd3BpeGVsX2ltYWdlcy93ZWJzaXRlX2NvbnRlbnQvcHUyMzMxNzg4LWltYWdlLXJtNTAzLTAxXzEtbDBqOXFyYzMucG5n.png?s=NjVuBb-Kdw49uxifZtlp1-3P4mypZAScmHj9-qHiDSk",
            header: "Third Card",
            description: "Third card description.",
            alternativeText: "Third card accessible description.",
            href: "javascript:void(0);"
        },
        {
            src: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCMAjW4cXmkgYlCgDyGhI2SmgRqYZXqKsYzQ&usqp=CAU",
            header: "Fourth Card",
            description: "Fourth card description.",
            alternativeText: "Fourth card accessible description.",
            href: "javascript:void(0);"
        },
    ]

}