import 'package:flutter/material.dart';

class SafeZoneChatbotScreen extends StatefulWidget {
  const SafeZoneChatbotScreen({super.key});
  @override
  State<SafeZoneChatbotScreen> createState() => _SafeZoneChatbotScreenState();
}

class _SafeZoneChatbotScreenState extends State<SafeZoneChatbotScreen> {
  final ScrollController _scrollController = ScrollController();
  final List<_ChatMessage> _messages = [
    _ChatMessage(
      isBot: true,
      text:
          '👋 Hi! I\'m SafeZone Assistant. I can help you report incidents, check area safety, or handle SOS. Try:\n\n"Report harassment near bus stand",\n"Is Kankanady safe?",\nor type "SOS".',
      hasCard: false,
    ),
    _ChatMessage(
      isBot: false,
      text: 'Check safety status for my current location.',
      hasCard: false,
    ),
    _ChatMessage(
      isBot: true,
      text:
          '👋 Hi! I\'m SafeZone Assistant. I can help you report incidents, check area safety, or handle SOS. Try:\n\n"Report harassment near bus stand",\n"Is Kankanady safe?",\nor type "SOS".',
      hasCard: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFF1F5),
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                itemCount: _messages.length + 1,
                itemBuilder: (context, index) {
                  if (index == 1) {
                    return Column(
                      children: [
                        _buildChatBubble(_messages[0]),
                        const SizedBox(height: 20),
                        _buildDayDivider('TODAY'),
                        const SizedBox(height: 20),
                      ],
                    );
                  }
                  if (index == 0) return const SizedBox.shrink();
                  final msgIndex = index - 1;
                  if (msgIndex >= _messages.length) return const SizedBox.shrink();
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: _buildChatBubble(_messages[msgIndex]),
                  );
                },
              ),
            ),
            _buildInputBar(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
      child: Row(
        children: [
          const Text(
            'SafeZone Chatbot',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A1A2E),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDayDivider(String label) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
        decoration: BoxDecoration(
          color: const Color(0xFFDDE0EA),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Color(0xFF888888),
            letterSpacing: 1,
          ),
        ),
      ),
    );
  }

  Widget _buildChatBubble(_ChatMessage msg) {
    if (!msg.isBot) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
              decoration: BoxDecoration(
                color: const Color(0xFFB5E61D),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(4),
                ),
              ),
              child: Text(
                msg.text,
                style: const TextStyle(fontSize: 15, color: Color(0xFF1A1A2E), height: 1.4),
              ),
            ),
          ),
          const SizedBox(width: 10),
          CircleAvatar(
            radius: 18,
            backgroundImage: const NetworkImage('https://randomuser.me/api/portraits/men/32.jpg'),
          ),
        ],
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: const BoxDecoration(
            color: Color(0xFF1A2420),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.support_agent, color: Colors.white, size: 20),
        ),
        const SizedBox(width: 10),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: _buildBotText(msg.text),
              ),
              if (msg.hasCard) ...[
                const SizedBox(height: 10),
                _buildSecureZoneCard(),
              ],
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBotText(String text) {
    // Render SOS in red, italic quoted parts
    final lines = text.split('\n');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: lines.map((line) {
        if (line.contains('"SOS"')) {
          final parts = line.split('"SOS"');
          return RichText(
            text: TextSpan(
              style: const TextStyle(fontSize: 15, color: Color(0xFF1A1A2E), height: 1.5),
              children: [
                TextSpan(text: parts[0]),
                const TextSpan(
                  text: '"SOS"',
                  style: TextStyle(color: Color(0xFFD32F2F), fontWeight: FontWeight.w600),
                ),
                if (parts.length > 1) TextSpan(text: parts[1]),
              ],
            ),
          );
        }
        final isItalic = line.startsWith('"') && line.contains('"');
        return Text(
          line,
          style: TextStyle(
            fontSize: 15,
            color: const Color(0xFF1A1A2E),
            height: 1.5,
            fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
          ),
        );
      }).toList(),
    );
  }

  Widget _buildSecureZoneCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 140,
                  color: const Color(0xFFE8EAF0),
                  child: Center(
                    child: Icon(Icons.phone_android, size: 60, color: Colors.grey[400]),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1A2420),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.location_on_outlined, color: Color(0xFFB5E61D), size: 16),
                      SizedBox(width: 6),
                      Text(
                        'SECURE ZONE',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'RECENT ALERTS',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[500],
                        letterSpacing: 0.8,
                      ),
                    ),
                    const SizedBox(height: 2),
                    const Text(
                      '0 Active Threats',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1A1A2E),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFB5E61D),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'VIEW DETAILS',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A2420),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputBar() {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[300]!),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.add, size: 20, color: Color(0xFF1A1A2E)),
          ),
          const SizedBox(width: 10),
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Type a message...',
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.zero,
              ),
              style: TextStyle(fontSize: 15),
            ),
          ),
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              color: Color(0xFF1A2420),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.arrow_upward, color: Color(0xFFB5E61D), size: 20),
          ),
        ],
      ),
    );
  }
}

class _ChatMessage {
  final bool isBot;
  final String text;
  final bool hasCard;
  const _ChatMessage({required this.isBot, required this.text, required this.hasCard});
}