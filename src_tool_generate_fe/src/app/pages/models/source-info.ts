export class SourceInfo{
  artifactID: string;
  groupId: string;
  springVersion: string;
  angularVersion: string;
  javaVersion: string;
  name: string;
  description: string;
  packageName: string;
  databaseType: string;
  databaseUrl: string;
  username: string;
  password: string;

  constructor(artifactID: string, groupId: string, springVersion: string, angularVersion: string, javaVersion: string, name: string, description: string, databaseType: string, databaseUrl: string, username: string, password: string) {
    this.artifactID = artifactID;
    this.groupId = groupId;
    this.springVersion = springVersion;
    this.angularVersion = angularVersion;
    this.javaVersion = javaVersion;
    this.name = name;
    this.description = description;
    this.packageName = groupId + "." + artifactID;
    this.databaseType = databaseType;
    this.databaseUrl = databaseUrl;
    this.username = username;
    this.password = password;
  }
}
