##Design Doc

#Dynamic UI
This will be handled by A/B testing. This allows for API-configuration via flipping the values associated with each treatment group from a internal tool or vendor provided portal. These values will direct/route the code path to the appropriate UI at the site of feature integration / integration point. In this example, the RootCoordinatorView is the feature integration point and integrates the given VerticalListView into the code path. There already exists logic that could be built upon to route different UI's i.e. MatrixView, or SearchView by adding different enums to the RootCoordinator's view state (adding other cases to the already existing "case authorized", such as "case matrix", "case search"). 

The additional views(matrix, search) would need to be built out prior to the A/B test being conducted. Where appropriate the feature would reuse UI components from the sharedUI package i.e. the top horizontal selection view could be reused for both matrix and search features. In simpler terms, the two new features would create new view components that are unique to their feature such as the grid for a matrix and a text input bar for a search and compose those unique UI components with the reusable sharable components.

The RootCoordinator would then need to fetch the value from the A/B test endpoint and would use that value to set the state appropriately.
The accompanying view, RootCoordinatorView, would then handle each additional state and route the appropriate feature.


#Dyanmic Input
This will be handled by a protocol and providing generic types of the protocol to the viewModels. This allows for the views and viewModels to have a common ground for what data is available and can be expected to be used/displayed. In our case, we would be using the titles for each pronoun, or sexual orientation, or ehtnicity, or religion, and their accompanying id. The titles are used for the UI layer, and the IDs are used for the communication with the service.
BY providing a generic as our protocol type in our feature, we open up the possibility of reusing the same feature with a different input type that also conforms to the protocol. To do so, we would just need to create a new input type i.e. Sexual Orientation, and have that struct conform/extend the protocol. Once the input type is set up, we can then reuse the feature by changing the type we provide in the generic type. In our case we would swap Pronoun for SexualOrientation like so `VerticalListViewModel<Pronoun>` to `VerticalListViewModel<SexualOrientation>` and initalize with the appropriate data, and our UI would be able to render the new type and the viewModel would also be able to process the data for the new type as well.
