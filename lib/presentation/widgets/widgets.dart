import 'package:flutter/material.dart';
import 'package:salla/presentation/screens/onboarding_screen.dart';

Widget buildOnboardingItem(BoardingModel boarding) => Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          "${boarding.image}",
          fit: BoxFit.cover, 
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          '${boarding.title}',
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Padding(
  padding: const EdgeInsets.all(15.0), 
  child: Text(
    '${boarding.body}', 
    overflow: TextOverflow.ellipsis,
    maxLines: 4,
    style: const TextStyle(
      fontSize: 18,
      color: Color.fromARGB(255, 211, 210, 210),
    ),
  ),
),

      ],
    );

     


class DefaultTextFormField extends StatelessWidget {
  final ValueChanged<String>? onChange;
  final TextEditingController? controller;
  final GestureTapCallback? onTap;
  final String hint;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? suffixPressed;

  const DefaultTextFormField({
    super.key,
    this.onChange,
    this.controller,
    this.onTap,
    required this.hint,
    required this.prefixIcon,
    this.suffixIcon,
    this.suffixPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChange,
      controller: controller,
      onTap: onTap,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(prefixIcon),
        suffixIcon: suffixIcon != null
            ? IconButton(
                icon: Icon(suffixIcon),
                onPressed: suffixPressed,
              )
            : null,
        hintStyle: const TextStyle(),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 222, 184, 196),
          ),
        ),
      ),
    );
  }
}

  


class DefaultButton extends StatelessWidget {
  final String text;
  final GestureTapCallback? onTap;

  const DefaultButton({
    super.key,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 222, 184, 196),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

        


