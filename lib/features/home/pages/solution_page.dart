import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:ubt_pbb/config/constants/app_colors.dart';
import 'package:ubt_pbb/config/widgets/cors_aware_image.dart';
import 'package:ubt_pbb/features/home/models/solution_model.dart';

class SolutionPage extends StatefulWidget {
  final SolutionQuestion solutionQuestion;
  const SolutionPage({
    super.key,
    required this.solutionQuestion,
  });

  @override
  State<SolutionPage> createState() => _SolutionPageState();
}

class _SolutionPageState extends State<SolutionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FB),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.mainBlue,
        foregroundColor: Colors.white,
        title: const Text(
          'Шешім',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Контекст (если есть)
            if (widget.solutionQuestion.context != null) ...[
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.solutionQuestion.context!.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.mainBlue,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildHtmlWithImages(widget.solutionQuestion.context!.bodyHtml),
                  ],
                ),
              ),
            ],

            // Вопрос
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Сұрақ:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.mainBlue,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildHtmlWithImages(widget.solutionQuestion.questionHtml),
                ],
              ),
            ),

            // Правильные ответы
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.green.shade200,
                  width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: Colors.green.shade700,
                        size: 24,
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Дұрыс жауап:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  _buildAnswer(widget.solutionQuestion.answer),
                ],
              ),
            ),

            // Объяснение
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.lightbulb_outline,
                        color: AppColors.mainBlue,
                        size: 24,
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Түсіндірме:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.mainBlue,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  _buildHtmlWithImages(widget.solutionQuestion.explanationHtml),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnswer(SolutionAnswer answer) {
    return answer.when(
      single: (kind, correctOption) {
        return Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Colors.green.shade300,
              width: 1,
            ),
          ),
          child: _buildHtmlWithImages(correctOption.labelHtml),
        );
      },
      multiple: (kind, correctOptions) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: correctOptions.asMap().entries.map((entry) {
            final index = entry.key;
            final option = entry.value;
            return Container(
              margin: EdgeInsets.only(bottom: index < correctOptions.length - 1 ? 8 : 0),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Colors.green.shade300,
                  width: 1,
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildHtmlWithImages(option.labelHtml),
                  ),
                ],
              ),
            );
          }).toList(),
        );
      },
      matching: (kind, rows) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: rows.map((row) {
            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Colors.green.shade300,
                  width: 1,
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Сол жақ:',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 4),
                        _buildHtmlWithImages(row.rowPromptHtml),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.green,
                      size: 20,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Оң жақ:',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 4),
                        _buildHtmlWithImages(row.optionLabelHtml),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        );
      },
    );
  }

  Widget _buildHtmlWithImages(String htmlContent, {double? fontSize, double? lineHeight}) {
    final styleMap = <String, Style>{};
    if (lineHeight != null) {
      styleMap['*'] = Style(
        fontSize: FontSize(fontSize ?? 16),
        lineHeight: LineHeight(lineHeight),
      );
    } else {
      styleMap['*'] = Style(
        fontSize: FontSize(fontSize ?? 16),
      );
    }
    final style = styleMap;

    if (htmlContent.contains('<img')) {
      return Builder(
        builder: (context) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ..._extractAndShowImages(context, htmlContent),
            Html(
              data: _removeImagesFromHtml(htmlContent),
              shrinkWrap: true,
              extensions: [_mathExtension(), _mathExtension2()],
              style: style,
            ),
          ],
        ),
      );
    } else {
      return Html(
        data: htmlContent,
        shrinkWrap: true,
        extensions: [_mathExtension(), _mathExtension2()],
        style: style,
      );
    }
  }

  List<Widget> _extractAndShowImages(BuildContext context, String htmlContent) {
    final List<Widget> imageWidgets = [];
    final RegExp imgRegex = RegExp(r'<img[^>]*>', caseSensitive: false);
    final matches = imgRegex.allMatches(htmlContent);

    for (final match in matches) {
      final imgTag = match.group(0)!;

      String? src;
      
      var srcRegex = RegExp(r'src="([^"]*)"', caseSensitive: false);
      var srcMatch = srcRegex.firstMatch(imgTag);
      src = srcMatch?.group(1);
      
      if (src == null || src.isEmpty) {
        srcRegex = RegExp(r"src='([^']*)'", caseSensitive: false);
        srcMatch = srcRegex.firstMatch(imgTag);
        src = srcMatch?.group(1);
      }
      
      if (src == null || src.isEmpty) {
        srcRegex = RegExp(r'src=([^\s>]*)', caseSensitive: false);
        srcMatch = srcRegex.firstMatch(imgTag);
        src = srcMatch?.group(1);
      }

      if (src != null && src.isNotEmpty) {
        src = src
            .replaceAll('&amp;', '&')
            .replaceAll('&lt;', '<')
            .replaceAll('&gt;', '>')
            .replaceAll('&quot;', '"')
            .replaceAll('&#39;', "'")
            .replaceAll('&nbsp;', ' ')
            .trim();
        
        src = src.replaceAll(RegExp(r'\s+'), '');
      }

      final styleRegex = RegExp(r'style="([^"]*)"', caseSensitive: false);
      final styleMatch = styleRegex.firstMatch(imgTag);
      final style = styleMatch?.group(1);

      if (src != null && src.isNotEmpty) {
        final imageUrl = src;
        double? width;
        double? height;

        if (style != null) {
          final widthRegex = RegExp(r'width:\s*(\d+)px');
          final heightRegex = RegExp(r'height:\s*(\d+)px');

          final widthMatch = widthRegex.firstMatch(style);
          final heightMatch = heightRegex.firstMatch(style);

          if (widthMatch != null) {
            width = double.tryParse(widthMatch.group(1)!);
          }
          if (heightMatch != null) {
            height = double.tryParse(heightMatch.group(1)!);
          }
        }

        imageWidgets.add(
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => _FullScreenImageViewer(imageUrl: imageUrl),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 8),
              constraints: BoxConstraints(
                maxWidth: width ?? double.infinity,
                maxHeight: height ?? 300,
              ),
              child: CorsAwareImage(
                imageUrl: imageUrl,
                fit: BoxFit.contain,
                placeholder: const Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
        );
      }
    }

    return imageWidgets;
  }

  String _removeImagesFromHtml(String htmlContent) {
    return htmlContent.replaceAll(RegExp(r'<img[^>]*>', caseSensitive: false), '');
  }

  TagExtension _mathExtension() => TagExtension(
        tagsToExtend: {"span"},
        builder: (ctx) {
          try {
            final innerHtml = ctx.innerHtml;
            if (!innerHtml.contains(r'\(') && !innerHtml.contains(r'\[')) {
              return Text(innerHtml);
            }
            final formula = innerHtml.replaceAll(r"\(", "").replaceAll(r"\)", "").replaceAll(r"\[", "").replaceAll(r"\]", "").trim();
            if (formula.isEmpty) {
              return Text(innerHtml);
            }
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              margin: const EdgeInsets.symmetric(vertical: 2),
              child: Math.tex(
                formula,
                mathStyle: MathStyle.text,
                textStyle: const TextStyle(fontSize: 18, color: Colors.black),
              ),
            );
          } catch (e) {
            return Text(ctx.innerHtml);
          }
        },
      );

  TagExtension _mathExtension2() => TagExtension(
        tagsToExtend: {"span"},
        builder: (ctx) {
          try {
            final innerHtml = ctx.innerHtml;
            if (!innerHtml.contains(r'\(') && !innerHtml.contains(r'\[')) {
              return Text(innerHtml);
            }
            final formula = innerHtml.replaceAll(r"\(", "").replaceAll(r"\)", "").replaceAll(r"\[", "").replaceAll(r"\]", "").trim();
            if (formula.isEmpty) {
              return Text(innerHtml);
            }
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              margin: const EdgeInsets.symmetric(vertical: 2),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Math.tex(
                  formula,
                  textStyle: const TextStyle(fontSize: 16),
                ),
              ),
            );
          } catch (e) {
            return Text(ctx.innerHtml);
          }
        },
      );
}

// Виджет для полноэкранного просмотра изображения
class _FullScreenImageViewer extends StatelessWidget {
  final String imageUrl;

  const _FullScreenImageViewer({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: InteractiveViewer(
          minScale: 0.5,
          maxScale: 4.0,
          child: CorsAwareImage(
            imageUrl: imageUrl,
            fit: BoxFit.contain,
            placeholder: const Center(
              child: CircularProgressIndicator(color: Colors.white),
            ),
            errorWidget: (context, url, error) => const Center(
              child: Icon(Icons.error, color: Colors.white, size: 48),
            ),
          ),
        ),
      ),
    );
  }
}
