# TenTen

## ✨ Description
Movie App with Advanced Features 🎬

This flutter semi corner project is a sophisticated movie app built using The Model-View-Controller (MVC) design pattern.
And State Management Bloc (cubit). 
Additionally, a dark mode feature is seamlessly integrated using Cubit and States for enhanced visual comfort.

1. Multiple Movie Categories:
   - The app categorizes movies into four sections: Now Playing, Popular, Top Rated, and Upcoming. Users can easily navigate and explore movies based on these categories.

2. Reusable Components and Widgets:
   - Embrace modular design with reusable components and widgets, ensuring code reusability, maintainability, and scalability.

3. Intelligent Search Functionality:
   - The app includes a robust search feature that allows users to search for movies efficiently. The search function is intelligent, updating results letter by letter, regardless of capitalization. The keyboard automatically appears upon tapping the search icon and 
   disappears during a lockdown scenario.


4. No Movie Found :
   - In cases where a searched movie is not available, the app displays a No Movie Found Widget, offering a user-friendly experience and managing user expectations.

5. Offline Mode:
   - The app gracefully handles unexpected loss of internet connectivity by presenting an offline screen. Users are informed about the status of their connection, ensuring a seamless transition between online and offline states.


6. Hero Animation for Movie Details:
   - Clicking on any movie triggers a visually appealing hero animation, seamlessly transitioning the user to the movie details page. This adds a layer of sophistication to the user interface.

7. Custom Scroll View in Details Screen:
   - Enhance the scrolling experience with a custom scroll view (Slivers) in the details screen, ensuring fluid navigation and a delightful user interface.

8. Trailer Viewing on YouTube:
   - Users can click on a movie and effortlessly watch its trailer on YouTube directly from the application, adding an extra layer of engagement.

9. Contributions:
   - Contributions to this project are welcome. Developers can follow the MVC architecture, Bloc and Cubit for state management, and adhere to the coding standards defined in the project guidelines.
     
## 📱 Screenshots of the application

<div>
    <img src="https://github.com/Marwanhoo/flutter_task_semi_corner/assets/125823028/4b565c95-548c-4b02-aa25-2dd5f03ca71a" width="35%">
    <img src="https://github.com/Marwanhoo/flutter_task_semi_corner/assets/125823028/f68984dd-8054-400f-83a1-77d6a35cfa5e" width="35%">
     <img src="https://github.com/Marwanhoo/flutter_task_semi_corner/assets/125823028/f8b0914e-7a59-48dc-b339-6b467246a0ea" width="35%">
    <img src="https://github.com/Marwanhoo/flutter_task_semi_corner/assets/125823028/cf51c74e-6443-46be-978a-2e23069f5311" width="35%">
   <img src="https://github.com/Marwanhoo/flutter_task_semi_corner/assets/125823028/31ff4b40-d074-4f51-8c20-c1af45adc85e" width="35%">
  <img src="https://github.com/Marwanhoo/flutter_task_semi_corner/assets/125823028/fc3cad16-8823-454d-b560-0911b0e681b1" width="35%">
  <img src="https://github.com/Marwanhoo/flutter_task_semi_corner/assets/125823028/a481447c-be37-4c99-9ad2-fb1142ce08b3" width="35%">
  <img src="https://github.com/Marwanhoo/flutter_task_semi_corner/assets/125823028/9a147900-d236-42cc-a329-9f3e9a6f570e" width="35%">
  <img src="https://github.com/Marwanhoo/flutter_task_semi_corner/assets/125823028/2ee08fb9-e8b9-49c4-8ed2-287ff72fbaab"  width="35%">
  <img src="https://github.com/Marwanhoo/flutter_task_semi_corner/assets/125823028/468c1854-9542-4dc8-aa35-3f6f8d0c7e98" width="35%">
    <img src="https://github.com/Marwanhoo/flutter_task_semi_corner/assets/125823028/73b04aae-b99a-4d93-b5fc-fad7e6a9d5c1" width="35%">
    <img src="https://github.com/Marwanhoo/flutter_task_semi_corner/assets/125823028/bfd05cb3-e9ce-416d-b0e3-53c300cb2c0a" width="35%">
</div>

## 🎥 Video


https://github.com/Marwanhoo/flutter_task_semi_corner/assets/125823028/eea319a7-65bd-4dea-a386-0dbd479c64ac



## 📄 Project Structure
Visual Representation of the project's directory structure
- `lib/`
  - `controller/`
  - `layoutt`
  - `main/`
  - `model/`
  - `routing/`
  - `view/`
  - `widgets`

## 🌴 Folders tree
```
flutter semi corner/
└── lib/
    ├── controller/
    │   ├── bloc_observer/
    │   │   └── bloc_observer.dart
    │   ├── general_cubit/
    │   │   ├── general_cubit.dart
    │   │   └── general_state.dart
    │   └── theme_cubit/
    │       ├── theme_cubit.dart
    │       └── theme_state.dart
    ├── layout/
    │   └── layout_screen.dart
    ├── main/
    │   └── main.dart
    ├── model/
    │   ├── models/
    │   │   ├── movies_model.dart
    │   │   └── video_model.dart
    │   ├── repository/
    │   │   └── movies_repository.dart
    │   └── service/
    │       └── movies_web_services.dart
    ├── routing/
    │   └── app_router.dart
    ├── view/
    │   ├── details_view.dart
    │   ├── now_playing_view.dart
    │   ├── popular_view.dart
    │   ├── top_rated_view.dart
    │   └── upcoming_view.dart
    └── widgets/
        ├── custom_drawer.dart
        ├── custom_search_field.dart
        ├── no_movies_found.dart
        ├── offline_screen.dart
        └── ont_item_builder.dart
```
