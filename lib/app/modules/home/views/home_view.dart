import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import '../../../../common_widget/player_setup.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      assignId: true,
      builder: (logic) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('Audio Player'),
          ),
          body: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 300,
                    width: Get.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5_f-3Npwnj40B6u8O8WmcX8swxRqUS8ncQg&usqp=CAU',
                        ),
                      ),
                    ),
                  ),
                ),
                Spacer(),
                StreamBuilder<PositionData>(
                  stream: positionDataStream,
                  builder: (context, snapshot) {
                    final positionData = snapshot.data;
                    return SeekBar(
                      duration: positionData?.duration ?? Duration.zero,
                      position: positionData?.position ?? Duration.zero,
                      bufferedPosition: positionData?.bufferedPosition ?? Duration.zero,
                      onChangeEnd: (newPosition) {
                        player.seek(newPosition);
                      },
                    );
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(left: 70, right: 70),
                  child: Container(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        StreamBuilder<SequenceState?>(
                          stream: player.sequenceStateStream,
                          builder: (context, snapshot) => IconButton(
                            icon: Icon(Icons.skip_previous_outlined, color: Colors.black, size: 30),
                            onPressed: player.hasPrevious ? player.seekToPrevious : null,
                          ),
                        ),
                        StreamBuilder<PlayerState>(
                          stream: player.playerStateStream,
                          builder: (context, snapshot) {
                            final playerState = snapshot.data;
                            final processingState = playerState?.processingState;
                            final playing = playerState?.playing;
                            if (processingState == ProcessingState.loading || processingState == ProcessingState.buffering) {
                              return CircularProgressIndicator();
                            } else if (playing != true) {
                              return Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                height: 60,
                                width: 50,
                                alignment: Alignment.center,
                                child: IconButton(
                                  icon: Icon(Icons.play_arrow, color: Colors.black, size: 30),
                                  // iconSize: 50.0,
                                  onPressed: player.play,
                                ),
                              );
                            } else if (processingState != ProcessingState.completed) {
                              return Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(100)),
                                height: 60,
                                width: 50,
                                child: IconButton(
                                  icon: Icon(Icons.pause, color: Colors.black, size: 30),
                                  onPressed: player.pause,
                                ),
                              );
                            } else {
                              return IconButton(
                                icon: Icon(Icons.replay, color: Colors.white, size: 50),
                                iconSize: 64.0,
                                onPressed: () => player.seek(Duration.zero, index: player.effectiveIndices!.first),
                              );
                            }
                          },
                        ),
                        StreamBuilder<SequenceState?>(
                          stream: player.sequenceStateStream,
                          builder: (context, snapshot) => IconButton(
                            icon: Icon(
                              Icons.skip_next_outlined,
                              color: Colors.black,
                              size: 30,
                            ),
                            onPressed: player.hasNext ? player.seekToNext : null,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
