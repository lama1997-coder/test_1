part of 'import.dart'; // Import the CountdownCompletedEvent

class CountdownItem extends StatelessWidget {
  final String gifUrl;
  final int itemId; 

  CountdownItem({required this.gifUrl, required this.itemId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TimerCubit(10)..startTimer(),
      child: BlocListener<TimerCubit, int>(
        listener: (context, timeLeft) {
          if (timeLeft == 0) {
            EventBus().emit(CountdownCompletedEvent(itemId));
          }
        },
        child: BlocBuilder<TimerCubit, int>(
          builder: (context, timeLeft) {
            return ListTile(
              leading: CachedNetworkImage(
                imageUrl: gifUrl,
                placeholder: (context, url) =>const  CircularProgressIndicator(),
                errorWidget: (context, url, error) =>const Icon(Icons.error),
                width: 50,
                height: 50,
              ),
              title: Text('Time Left: $timeLeft seconds $itemId'),
            );
          },
        ),
      ),
    );
  }
}
