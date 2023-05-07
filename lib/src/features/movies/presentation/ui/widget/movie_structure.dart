import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// local imports
import '../../state/riverpod/movie_future_provider.dart';
import '../../../../core/utils/common_constants.dart';
import '../../../../config/theme/responsiveness.dart';
import '../../state/riverpod/movie_viewport_index_provider.dart';

class MovieStructure extends ConsumerStatefulWidget {
  const MovieStructure({super.key});

  @override
  MovieStructureState createState() => MovieStructureState();
}

class MovieStructureState extends ConsumerState<MovieStructure> {
  @override
  Widget build(BuildContext context) {
    // for responsive ui
    ScaleUi().init(context);
    /**
     * !! your removing the provider
     * !! this would be a shared component for 
     * !! each page and your passing the 
     * !! movies as a argument later
     */
    final movies = ref.watch(movieProvider);
    int _movieIndex = ref.watch(viewportIndexProvider);
    final horizontalScale = ScaleUi.safeBlockHorizontal;
    final verticalScale = ScaleUi.safeBlockVertical;
    return movies.when(
        data: (movies) {
          return SizedBox(
            height: verticalScale * 600,
            child: PageView.builder(
              controller: PageController(viewportFraction: 0.8),
              onPageChanged: (int index) {
                // this updates the state value to the index
                // to run animation
                ref
                    .read(viewportIndexProvider.notifier)
                    .update((state) => index);
              },
              itemCount: movies.length,
              itemBuilder: (context, index) {
                // animation position value
                var rotate = _movieIndex == index ? 0.0 : (22 / 7) / 20;
                return Column(
                  children: [
                    TweenAnimationBuilder(
                      duration: const Duration(milliseconds: 400),
                      tween: Tween(
                        begin: rotate,
                        end: rotate,
                      ),
                      curve: Curves.ease,
                      child: GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => MovieDetails(
                          //       movieData: movies[index].id,
                          //     ),
                          //   ),
                          // );
                        },
                        child: Container(
                          height: verticalScale * 400,
                          width: horizontalScale * 400,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                imagePath + movies[index].cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      builder: (context, value, child) {
                        return Transform.rotate(
                          angle: value,
                          child: child,
                        );
                      },
                    ),
                    Flexible(
                      child: Container(
                        height: verticalScale * 100,
                        width: horizontalScale * 200,
                        padding: EdgeInsetsDirectional.symmetric(
                            vertical: verticalScale * 20),
                        child: Text(
                          movies[index].title.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: ScaleUi.responsiveFontSize(context, 20),
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        height: verticalScale * 40,
                        width: horizontalScale * 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.star,
                              /**
                               * ?? remove test color
                               */
                              color: Colors.green,
                            ),
                            Text(
                              movies[index].rating.toStringAsFixed(1),
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        },
        error: (error, stack) {
          return Text('An Error occured Error: $error');
        },
        loading: () => const CircularProgressIndicator());
  }
}
