class ProjectsUtils{
   String image = "";
   String title = "";
   String subtitle = "";
   String? androidLink;
   String? iosLink;
   String? webLink;

ProjectsUtils.n();

  ProjectsUtils({
    required this.image,
    required this.title,
    required this.subtitle,
    this.androidLink,
    this.iosLink,
    this.webLink
  });

  //################
  // HOBBY PROJECT
  List<ProjectsUtils> hobbyProjectsUtils = [

    //EcoMoment
    ProjectsUtils(image: "assets/projects/EcoMoment.png",
    title: "EcoMoment",
    subtitle: "Ecomoment subtuitle",
    webLink: "www.google.com"
    )

    //Outros...
  ];
}