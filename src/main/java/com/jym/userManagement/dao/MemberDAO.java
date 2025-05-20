package com.jym.userManagement.dao;

import com.jym.userManagement.model.Member;
import com.jym.util.FileUtil;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class MemberDAO {
    private static final String FILE_PATH = "D:\\java\\untitled\\data\\members.txt";

    public Member getMemberByEmail(String email) throws IOException {
        List<String> lines = FileUtil.readLines(FILE_PATH);
        for (String line : lines) {
            String[] parts = line.split(",");
            if (parts.length >= 7 && parts[2].equals(email)) {
                return new Member(parts[0], parts[1], parts[2], LocalDate.parse(parts[3]),
                        parts[4], parts[5], LocalDate.parse(parts[6]));
            }
        }
        return null;
    }

    public boolean emailExists(String email) throws IOException {
        return getMemberByEmail(email) != null;
    }

    public void saveMember(Member member) throws IOException {
        List<String> lines = FileUtil.readLines(FILE_PATH);
        lines.add(member.toString());
        FileUtil.writeLines(FILE_PATH, lines);
    }

    public String generateMemberId() throws IOException {
        List<String> lines = FileUtil.readLines(FILE_PATH);
        int count = lines.size() + 1;
        return String.format("M%03d", count); // e.g., M001, M002, ...
    }

    public List<Member> getAllMembers() throws IOException {
        List<Member> members = new ArrayList<>();
        List<String> lines = FileUtil.readLines(FILE_PATH);
        for (String line : lines) {
            String[] parts = line.split(",");
            if (parts.length >= 7) {
                members.add(new Member(parts[0], parts[1], parts[2], LocalDate.parse(parts[3]),
                        parts[4], parts[5], LocalDate.parse(parts[6])));
            }
        }
        return members;
    }

    public void updateMember(Member member) throws IOException {
        List<String> lines = FileUtil.readLines(FILE_PATH);
        for (int i = 0; i < lines.size(); i++) {
            String[] parts = lines.get(i).split(",");
            if (parts.length >= 7 && parts[2].equals(member.getEmail())) {
                lines.set(i, member.toString());
                break;
            }
        }
        FileUtil.writeLines(FILE_PATH, lines);
    }
}
