

import 'package:flutter/material.dart';

class AnimatedItem extends StatelessWidget {
  AnimatedItem({
    Key? key,
    required double startDelayFraction,
    required this.controller,
    required this.child,
  })  : topPaddingAnimation = Tween(
    begin: 60.0,
    end: 0.0,
  ).animate(
    CurvedAnimation(
      parent: controller,
      curve: Interval(
        0.000 + startDelayFraction,
        0.400 + startDelayFraction,
        curve: Curves.ease,
      ),
    ),
  ),
        super(key: key);

  final Widget child;
  final AnimationController controller;
  final Animation<double> topPaddingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Padding(
          padding: EdgeInsets.only(top: topPaddingAnimation.value),
          child: child,
        );
      },
      child: child,
    );
  }
}

class AnimCategoryContainer extends StatefulWidget {
  final CategoryBean categoryBean;

    AnimCategoryContainer(this.categoryBean);

  @override
  AnimCategoryContainerState createState() => AnimCategoryContainerState();
}

class AnimCategoryContainerState extends State<AnimCategoryContainer>
    with SingleTickerProviderStateMixin {
  late bool isExpanded;
  late AnimationController controller;
  late Animation<EdgeInsetsGeometry> marginAnim;
   late Animation<BorderRadius?> radiusAnim;

  @override
  void initState() {
    super.initState();
    isExpanded = false;
    controller =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 200));

    marginAnim = Tween(
    begin: const EdgeInsets.symmetric(horizontal: 16),
    end: EdgeInsets.zero,
    ).animate(controller);
    radiusAnim = BorderRadiusTween(
    begin: BorderRadius.circular(16),
    end: BorderRadius.zero,
    ).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Container(
          margin: marginAnim.value,
          child: Material(
            shape: RoundedRectangleBorder(
              borderRadius: radiusAnim.value!,
            ),
            color: const Color(0xffb2ebf2),
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: () => onTap(),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    width: double.infinity,
                    height: 80,
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 24),
                          child: const FlutterLogo(
                            size: 48,

                          ),
                        ),
                        // TODO Download app
                        IconButton(onPressed: (){}, icon: const Icon(Icons.download,size: 30,color: Colors.white,)),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            widget.categoryBean.title,
                            style: const TextStyle(color: Colors.black, fontSize: 30),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ClipRect(
                    child: Align(
                      heightFactor: controller.value,
                      child: child,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      child: isExpanded || controller.isDismissed
          ? Column(
        children: [
          for (final demo in widget.categoryBean.categoryItems)
            AnimCategoryItem(demo),
          const SizedBox(height: 12),
        ],
      )
          : null,
    );
  }

  void onTap() {
    isExpanded = !isExpanded;
    if (isExpanded) {
      controller.forward();
      setState(() {});
    } else {
      controller.reverse().then<void>((value) {
        if (!mounted) {
          return;
        }
        setState(() {});
      });
    }
  }
}

class AnimCategoryItem extends StatefulWidget {
  final CategoryBean categoryBeanItem;

   const AnimCategoryItem(this.categoryBeanItem);

  @override
  AnimCategoryItemState createState() => AnimCategoryItemState();
}
/// Each items

class AnimCategoryItemState extends State<AnimCategoryItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),

      child: AspectRatio(
        aspectRatio:  3 / 2,
        child: Image(
          fit: BoxFit.contain,
          image: AssetImage(widget.categoryBeanItem.title),
        ),
      ),
    );
  }
}

class CategoryBean {
  IconData icon;
  String title;
  List<CategoryBean> categoryItems;
  VoidCallback onTap;

  CategoryBean(this.icon, this.title, this.categoryItems, this.onTap);
}

/// From  Flutter Awesome gallery