part of '../user_data_entry_screen.dart';

class UploadImg extends StatelessWidget {
  final File? img;
  const UploadImg({super.key, this.img});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          onPressed: () async {
            BlocProvider.of<UserDataCubit>(context).getImage();
          },
          child: const Text('Select Image'),
        ),
        img == null
            ? const Text("upload image")
            : Image.file(
                img!,
                width: 50, // Adjust the width as needed
                height: 50, // Adjust the height as needed
                fit: BoxFit.cover, // Adjust the fit mode as needed
              ),
      ],
    );
  }
}
