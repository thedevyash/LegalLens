import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_card/image_card.dart';
import 'package:sih_24/controllers/getnewsController.dart';
import 'package:sih_24/utils/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class LegalTrendsScreen extends StatefulWidget {
  const LegalTrendsScreen({super.key});

  @override
  State<LegalTrendsScreen> createState() => _LegalTrendsScreenState();
}

class _LegalTrendsScreenState extends State<LegalTrendsScreen> {
  GetnewsArticlesController getnewsArticlesController =
      Get.put(GetnewsArticlesController());
  void initState() {
    super.initState();
    getnewsArticlesController.getNewsArticles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: colors.background,
        title: Text(
          "Legal Trends",
          style: GoogleFonts.poppins(
              color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
      ),
      body: Obx(
        () => getnewsArticlesController.isLoading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : RefreshIndicator(
                onRefresh: () {
                  getnewsArticlesController.getNewsArticles();
                  return Future.value(true);
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 12),
                  child: ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.only(top: 6, bottom: 6),
                    itemCount: getnewsArticlesController.newsArticles.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 6.0),
                        child: GestureDetector(
                          onTap: () async {
                            String url = getnewsArticlesController
                                .newsArticles[index].url!;

                            if (await canLaunchUrl(Uri.parse(url))) {
                              await launchUrl(Uri.parse(url));
                            } else {
                              print('Could not launch $url');
                            }
                          },
                          child: TransparentImageCard(
                            borderRadius: 20,
                            tags: [
                              Container(
                                decoration: BoxDecoration(
                                  color: colors.cream,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    getnewsArticlesController
                                                .newsArticles[index].author ==
                                            null
                                        ? "Unknown"
                                        : getnewsArticlesController
                                            .newsArticles[index].author!,
                                    style: GoogleFonts.poppins(
                                        color: Colors.black, fontSize: 12),
                                  ),
                                ),
                              ),
                            ],
                            imageProvider: NetworkImage(getnewsArticlesController
                                        .newsArticles[index].urlToImage ==
                                    null
                                ? "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.123rf.com%2Fphoto_104615274_stock-vector-no-image-available-icon-flat-vector.html&psig=AOvVaw3Q6Z"
                                : getnewsArticlesController
                                    .newsArticles[index].urlToImage!),
                            title: Text(
                              getnewsArticlesController
                                  .newsArticles[index].title!,
                              style: GoogleFonts.poppins(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                            description: Text(
                              getnewsArticlesController
                                  .newsArticles[index].description!,
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
      ),
    );
  }
}
