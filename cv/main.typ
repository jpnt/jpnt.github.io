#let configuration = yaml("configuration.yaml")
#import "@preview/swe-cv:1.0.0": *
// Page settings
#set page(margin: (left: 1.5cm, right: 1.5cm, top: 1.5cm, bottom: 1.5cm))
#set text(size: 10pt)

// Main header
#grid(
  columns: (1fr, 1fr, 1fr),
  align(left)[
    #link(configuration.header.email) \
    #configuration.header.phone \
  ],
  align(center)[
    #text(weight: "semibold",size: 1.8em)[#configuration.header.name] \
    #link(configuration.header.website)[#configuration.header.websiteDisplayName]
  ],
  align(right)[
    #configuration.header.github \
    #configuration.header.linkedin \
  ]
)


// Education
#section([Education])
#for ed in configuration.education [
  #exp-header((left: ed.location, center: text(weight: "bold")[#ed.name], right: ed.date))
  - #ed.degree

]

// spacer
#block(below: 0.8em)

// Work experience
#section([Employment])
#for exp in configuration.employment [
  #exp-header((left: exp.location, center: text(weight: "bold")[#exp.company], right: exp.date))
  #for responsibility in exp.responsibilities [
    - #responsibility
  ]
]

// spacer
#block(below: 0.8em)

// Professional Development
#section([Professional Development])
#for item in configuration.professional-development [
  - #item
]


// spacer
#block(below: 0.8em)

// Technical skills
#section([Technical Skills])
- Primary: #for skill in configuration.skills.primary [
  #skill\;
]
- Secondary: #for skill in configuration.skills.secondary [
  #skill\;
]
- Exposure: #for skill in configuration.skills.exposure [
  #skill\;
]

// spacer
#block(below: 0.8em)

// Projects
#section([Selected Projects])
#for project in configuration.projects [
  #project-header((title: project.title, website: project.website))
  #for contribution in project.contributions [
    - #contribution
  ]
]



