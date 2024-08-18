import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/routing/app_router.dart';
import '../cubits/agora/video_call_cubit.dart';
import '../widget/buttons_bar.dart';
import '../widget/local_video_widget.dart';
import '../widget/remote_video_widgets.dart';

class VideoCall extends StatelessWidget {
  const     VideoCall({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VideoCallCubit, VideoCallState>(
      listener: (context, state) {
        if (state is EndCallstate) {
          context.push(AppRouter.kDoctorSpecificSchedule);
        }
      },
      builder: (context, state) {
        VideoCallCubit cubit = VideoCallCubit.get(context);
        return Scaffold(
          body: (cubit.engine != null)
              ? SafeArea(
                  child: Stack(
                    children: [
                      Center(
                        child: remoteVideo(
                            remoteUid: cubit.RemoteUid,
                            engine: cubit.engine!,
                            channel_name: cubit.channel!),
                      ),
                      localVideo(cubit: cubit),
                      buttonsBar(cubit: cubit)
                    ],
                  ),
                )
              : const CircularProgressIndicator(),
        );
      },
    );
  }
}
