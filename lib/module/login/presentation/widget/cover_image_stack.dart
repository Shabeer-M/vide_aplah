import 'package:flutter/material.dart';

const coverImageKey = 'coverImageKey';
const stackChildKey = 'stackChildKey';

class CoverImageStack extends StatefulWidget {
  final Widget child;
  final double? coverImageHeight;
  final double? topOffset;
  final Image image;
  final EdgeInsets contentPadding;
  final String? semanticsLabel;

  const CoverImageStack({
    required this.child,
    required this.image,
    this.coverImageHeight,
    this.topOffset,
    this.semanticsLabel,
    this.contentPadding = _defaultContentPadding,
    Key? key,
  }) : super(key: key);

  @override
  State<CoverImageStack> createState() => _CoverImageStackState();
}

const EdgeInsets _defaultContentPadding = EdgeInsets.symmetric(
  horizontal: 0,
  vertical: 30,
);

class _CoverImageStackState extends State<CoverImageStack> {
  late MediaQueryData mediaQueryData;
  late ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    themeData = Theme.of(context);
    double coverImageHeight = widget.coverImageHeight ?? mediaQueryData.size.height * 0.3;
    double topOffset = widget.topOffset ?? coverImageHeight * .83;

    return SingleChildScrollView(
      child: Stack(
        children: [
          _buildCoverImage(
            image: widget.image,
            height: coverImageHeight,
          ),
          _buildChild(
            topOffset: topOffset,
            child: widget.child,
          )
        ],
      ),
    );
  }

  Widget _buildCoverImage({
    required double height,
    required Image image,
  }) {
    return Semantics(
      label: widget.semanticsLabel,
      child: SizedBox(
        key: const Key(coverImageKey),
        height: height,
        width: mediaQueryData.size.width,
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20 * mediaQueryData.textScaleFactor),
          ),
          child: image,
        ),
      ),
    );
  }

  Container _buildChild({
    required Widget child,
    required double topOffset,
  }) {
    return Container(
      key: const Key(stackChildKey),
      width: mediaQueryData.size.width,
      margin: EdgeInsets.only(
        left: 15 * mediaQueryData.textScaleFactor,
        right: 15 * mediaQueryData.textScaleFactor,
        top: topOffset,
      ),
      padding: widget.contentPadding,
      decoration: BoxDecoration(
        color: themeData.scaffoldBackgroundColor,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30 * mediaQueryData.textScaleFactor),
          bottom: Radius.circular(30 * mediaQueryData.textScaleFactor),
        ),
      ),
      child: child,
    );
  }
}
